---
title: Bump CLI
---

How to use the Bump command line interface.

## Installing Bump CLI

Bump CLI is a node package, currently [distributed via NPM](https://www.npmjs.com/package/bump-cli) which means you need to have Node v12+ interpreter installed on your computer and servers.

:::info
You can download a standalone package directly from the [latest Github release](https://github.com/bump-sh/cli/releases) assets if you don't use Node. We plan to distribute universal binaries to common package managers soon. Please check our [installation methods](https://github.com/bump-sh/bump-node-cli#installation) for updates.
:::

## Global installation

To install it globally, run the following command with NPM

```shell
npm install -g bump-cli
```

Or, with Yarn via

```shell
yarn global add bump-cli
```

## Add Bump CLI to your node project

As our CLI is a node package, you can easily embed it to your project by adding the package to your `package.json` file, either via NPM

```shell
npm install --save-dev bump-cli
```

Or via Yarn

```shell
yarn add --dev bump-cli
```

You can then use any Bump CLI commands via `npm exec` as such

```shell
npm exec -- bump --help
```

## How should I do if I'm not using Node?

Unfortunately, at the moment we only support the Node environment. However we plan to distribute universal binaries in the most common package managers very soon. In the meantime, you can download a standalone package directly from the [latest Github release](https://github.com/bump-sh/cli/releases) assets or you can push your documentation using [our API](https://developers.bump.sh/).

## Using Bump CLI

To list all the available commands, just type `bump`  in your command line environment. You can get some help anytime by using `--help` on any command. Example: `bump deploy --help` .

## Preview a file

When writing a documentation, you'll want to preview how it renders on Bump. This is exactly the goal of the `preview`  command: it will create a temporary documentation with a unique URL, which will be available for a short period of time.

Usage from a local OpenAPI or AsyncAPI file

```shell
bump preview path/to/file.json
```

You can also preview a file available from a URL

```shell
bump preview https://developers.bump.sh/source.yaml
```

### Live preview

By using the `--live` flag you can stay focused on API design (OpenAPI or AsyncAPI file) while seeing a continuously updated preview each time you save your API definition file.

- Launch the live preview command in your terminal

```shell
bump preview --live --open openapi-definition.json
```

- Edit your `openapi-definition.json` file in your favorite text editor
- Watch the live preview being updated each time your save your file!

:::info
You can create as many previews as you like without being authenticated. This is a **free and unlimited service**.
:::

## API diff or simple validation before a deployment

This is mainly used when you integrate Bump in your automated environments ([Continuous Integration](continuous-integration/index)). It will validate your documentation file to make sure it is parsed correctly by Bump. If you want to validate your API specification file before a deployment, you can either use:

- [the `bump diff` command](#api-diff-of-your-changes) if you also want to have a human diff summary of your API change

_or_

- [the `bump deploy --dry-run` command](#validation-before-a-deployment) if you only want to make sure the file is valid

### API diff of your changes

This command will output a diff summary of what has changed in the API. It can be used to ensure that future file deployment will work smoothly and to get a human diff summary during code reviews.

```shell
bump diff path/to/file.json --doc my-documentation
```

You can find your own `my-documentation` slug from your [documentation settings](https://bump.sh/docs).

:::caution
You will need to pass your private documentation access token for this command to work. Either with the `--token` flag or via the `BUMP_TOKEN` environment variable. This token can be found from your documentation `settings > CI deployment`page
:::

### Validation before a deployment

If you don't need a diff summary from the `bump diff` command explained above, you can also make sure your API specification file is valid and parsed correctly by Bump with the `bump deploy --dry-run` command. It can be used to ensure that future file deployment will work smoothly.

```shell
bump deploy --dry-run path/to/file.json --doc my-documentation
```

You can find your own `my-documentation` slug from your [documentation settings](https://bump.sh/docs).

:::caution
You will need to pass your private documentation access token for this command to work. Either with the `--token` flag or via the `BUMP_TOKEN` environment variable. This token can be found from your documentation `settings > CI deployment`page
:::

## Deploy a file

Once your documentation has been updated and merged, you want it to be live for your API users. This is what the `deploy` command is for. When deploying the new version, Bump will analyse your API structure and will generate a changelog item if the API structure has changed.

```shell
bump deploy path/to/file.json --doc my-documentation
```

You can find your own `my-documentation` slug from your [documentation settings](https://bump.sh/docs).

You can also deploy a given file to a different branch of your documentation with the `--branch <branch-name>` parameter. The branch will be created if it doesn't exist. More details about the branching feature is available on [this dedicated help page](../branching).

```shell
bump deploy path/to/file.json --doc my-documentation --branch staging
```

:::caution
You will need to pass your private documentation access token for this command to work. Either with the `--token` flag or via the `BUMP_TOKEN` environment variable. This token can be found from your documentation `settings > CI deployment`page.
:::

## Deploy a folder

When using the [Hub](../hubs) feature on Bump.sh, you might want to deploy multiple api definition files in a single command. The `deploy` command described in the [previous paragraph](#deploy-a-file) accepts a folder path as argument to do just that:

```shell
bump deploy path/to/apis/ --hub my-hub
```

:::info
You can find your own `my-hub` slug from your [hub settings](https://bump.sh/hubs).
:::

Take into account your file naming convention by using the `--filename-pattern <pattern>` option.

Note that it can include `*` wildcard special character, `{slug}` filter that will extract your documentation's slug from the filename, as well as any other fixed characters.

Here's a practical example. Suppose you have the following files in your `path/to/apis/` directory:

```shell
path/to/apis
└─ private-api-users-service.json
└─ partner-api-payments-service.yml
└─ public-api-contracts-service.yml
└─ data.json
└─ README
```

In order to deploy the 3 services api definition files from this folder (`private-api-users-service.json`, `partner-api-payments-service.yml` and `public-api-contracts-service.yml`). You can execute the following command:

```shell
bump deploy path/to/apis/ --hub my-hub --filename-pattern *-api-{slug}-service
```


:::caution
You will need to pass your private hub access token for this command to work. Either with the `--token` flag or via the `BUMP_TOKEN` environment variable. This token can be found from your hub `settings > CI deployment` page.
:::

## Compatible specification types

We currently support [OpenAPI](https://github.com/OAI/OpenAPI-Specification) from 2.0 (called Swagger) to 3.1 and [AsyncAPI 2.x](https://www.asyncapi.com/docs/reference/specification/v2.5.0) specification file types. Both YAML or JSON file formats are accepted file inputs to the CLI.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/bump-sh/cli](https://github.com/bump-sh/cli). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The Bump CLI project is released under the [MIT License](http://opensource.org/licenses/MIT).


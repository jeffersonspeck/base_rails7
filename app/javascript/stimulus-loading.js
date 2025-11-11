export function definitionsFromContext(context) {
  return context.keys().map((key) => ({
    identifier: key.replace(/^.*[\\/](.*)_controller\.js$/, "$1").replace("_", "-"),
    controllerConstructor: context(key).default
  }))
}
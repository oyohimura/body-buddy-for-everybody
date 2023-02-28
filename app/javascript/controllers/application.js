import { Application } from "@hotwired/stimulus"
import Popover from 'stimulus-popover'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

application.register("popover", Popover)

#!/bin/sh

# Argument 1: Command to run
run_command() {
    echo ">> $1"
    echo ""
    eval "$1"
}

# Argument 1: Command to run
run_command_reporting_status()
{
    local code=0

    run_command "$1" || code=$?

    if [ "${code}" = "0" ]; then
        print_success "Command \"$1\" exited with code ${code}"
    else
        print_error "Command \"$1\" exited with code ${code}"
    fi

    return ${code}
}

# Argument 1: Action
# Argument 2: Subject
print_header() {
    echo ""
    echo "*************************************************"
    echo "$1: $2"
    echo "*************************************************"
    echo ""
}

# Argument 1: Key
# Argument 2: Value
print_key_value_line() {
    echo "$1: $2"
}

# Argument 1: Text
print_error() {
    echo ""
    echo "😭 ERROR: $1"
    echo ""
}

# Argument 1: Text
print_success() {
    echo ""
    echo "👍 SUCCESS: $1"
    echo ""
}

# Argument 1: Text
print_info() {
    echo ""
    echo "ℹ️  INFO: $1"
    echo ""
}

# Argument 1: Text
print_warning() {
    echo ""
    echo "⚠️  WARNING: $1"
    echo ""
}

print_example() {
    print_header "Action" "Subject"
    print_key_value_line "Key" "Value"
    print_error "Something went horribly wrong!"
    print_success "It's a success!"
    print_info "I just wanted to let you know..."
    print_warning "Watch out!"
}

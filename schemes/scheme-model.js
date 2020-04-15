const db = require('../data/db-config');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
    addStep
};

function find () {
    return db('schemes');
}

function findById(id) {
    const results = db('schemes').where({ id }).first();
    if (results) {
        return results;
    }
    else {
        return null;
    }
}

// this takes the scheme_id as the parameter which is foreign key to id on schemes
function findSteps(id) {
    return db('steps')
    .join('schemes', 'steps.scheme_id', 'schemes.id')
    .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
    .where({ scheme_id: id });
}

function add(scheme) {
    return db('schemes').insert(scheme);
}

// stretch - add step to scheme
function addStep(step, scheme_id) {
    return db('steps').insert(step).where({ scheme_id });
}

function update(changes, id) {
    return db('schemes').where({ id }).update(changes);
}

function remove(id) {
    const removed = db('schemes').where({ id }).del();
    if (removed) {
        return removed;
    }
    else {
        return null;
    }
}

